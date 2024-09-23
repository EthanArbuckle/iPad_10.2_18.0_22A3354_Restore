@implementation CALNNotificationIconCache

- (CALNNotificationIconCache)initWithIconProvider:(id)a3
{
  id v5;
  CALNNotificationIconCache *v6;
  CALNNotificationIconCache *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CALNNotificationIconCache;
  v6 = -[CALNNotificationIconCache init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconProvider, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("CALNNotificationIconCacheQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (id)cachedIconPathForIconIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CALNNotificationIconCache *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_pathForCachedIconWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[CALNNotificationIconCache queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__CALNNotificationIconCache_cachedIconPathForIconIdentifier___block_invoke;
  v11[3] = &unk_24D484AF0;
  v15 = &v16;
  v7 = v5;
  v12 = v7;
  v13 = self;
  v8 = v4;
  v14 = v8;
  dispatch_sync(v6, v11);

  if (*((_BYTE *)v17 + 24))
    v9 = v7;
  else
    v9 = 0;

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __61__CALNNotificationIconCache_cachedIconPathForIconIdentifier___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32));

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_addIconWithIdentifier:toCacheAtPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)iconIdentifierForCachedIconPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_iconCacheDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v3, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "pathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("png")))
      {
        objc_msgSend(v8, "stringByDeletingPathExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)addIconsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  CALNNotificationIconCache *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  -[CALNNotificationIconCache queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__CALNNotificationIconCache_addIconsWithIdentifiers_error___block_invoke;
  v11[3] = &unk_24D484B18;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v22;
  v15 = &v16;
  dispatch_sync(v7, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __59__CALNNotificationIconCache_addIconsWithIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v24;
    v21 = *MEMORY[0x24BDD0B88];
    v20 = *MEMORY[0x24BDD0FC8];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x2199F1FA0]();
        objc_msgSend((id)objc_opt_class(), "_pathForCachedIconWithIdentifier:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

        if ((v10 & 1) == 0)
        {
          v11 = objc_msgSend(*(id *)(a1 + 40), "_addIconWithIdentifier:toCacheAtPath:", v6, v8);
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v13 = *(_BYTE *)(v12 + 24) ? v11 : 0;
          *(_BYTE *)(v12 + 24) = v13;
          if ((v11 & 1) == 0)
          {
            +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v30 = v6;
              _os_log_error_impl(&dword_215D9B000, v14, OS_LOG_TYPE_ERROR, "Failed to add icon to cache. IconIdentifier: %{public}@", buf, 0xCu);
            }

            v15 = (void *)MEMORY[0x24BDD1540];
            v27 = v20;
            v28 = CFSTR("Failed to add icon to cache.");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "errorWithDomain:code:userInfo:", v21, 512, v16);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v19 = *(void **)(v18 + 40);
            *(_QWORD *)(v18 + 40) = v17;

          }
        }

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v3);
  }

}

- (BOOL)forceRemoveAllCachedIconsWithError:(id *)a3
{
  NSObject *v5;
  char v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  -[CALNNotificationIconCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CALNNotificationIconCache_forceRemoveAllCachedIconsWithError___block_invoke;
  block[3] = &unk_24D484B40;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __64__CALNNotificationIconCache_forceRemoveAllCachedIconsWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id obj;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_iconCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_iconCacheDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

  }
}

- (BOOL)removeIconWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  -[CALNNotificationIconCache queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke;
  v11[3] = &unk_24D484B18;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v21;
  v14 = &v15;
  dispatch_sync(v7, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id obj;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 5;
  objc_msgSend((id)objc_opt_class(), "_pathForCachedIconWithIdentifier:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_2((uint64_t)(a1 + 5), v12, v13, v14, v15, v16, v17, v18);

    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0B88];
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = CFSTR("Icon does not exist and cannot be removed.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 512, v11);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1[7] + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[7];
  v7 = (uint64_t)(a1 + 7);
  v9 = *(_QWORD *)(v8 + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 - 8) + 8) + 24) = v10;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 - 8) + 8) + 24))
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_1(v2, v7, v11);
LABEL_8:

  }
}

- (BOOL)_addIconWithIdentifier:(id)a3 toCacheAtPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNNotificationIconCache queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[CALNNotificationIconCache iconProvider](self, "iconProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pngDataForIconWithIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!-[CALNNotificationIconCache _createCacheDirectoryIfNeeded](self, "_createCacheDirectoryIfNeeded"))
    {
      v11 = 0;
      goto LABEL_12;
    }
    v21 = 0;
    v11 = objc_msgSend(v10, "writeToFile:options:error:", v7, 0x10000000, &v21);
    v12 = v21;
    if ((v11 & 1) == 0)
    {
      +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v23 = v6;
        v24 = 2114;
        v25 = v7;
        v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_215D9B000, v13, OS_LOG_TYPE_ERROR, "Failed to save icon with identifier %{public}@ to path %{public}@. error = %{public}@", buf, 0x20u);
      }

    }
  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CALNNotificationIconCache _addIconWithIdentifier:toCacheAtPath:].cold.1((uint64_t)v6, v12, v14, v15, v16, v17, v18, v19);
    v11 = 0;
  }

LABEL_12:
  return v11;
}

- (BOOL)_createCacheDirectoryIfNeeded
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  -[CALNNotificationIconCache queue](self, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_iconCacheDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v15);
  v6 = v15;

  if ((v5 & 1) == 0)
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CALNNotificationIconCache _createCacheDirectoryIfNeeded].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v5;
}

+ (id)_pathForCachedIconWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_iconCacheDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("png"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_iconCacheDirectory
{
  void *v2;
  void *v3;

  CALNDefaultCalendarDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("NotificationIconCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CalIconProvider)iconProvider
{
  return self->_iconProvider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_iconProvider, 0);
}

void __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Failed to remove icon file. Icon Identifier: %{public}@ . Error %{public}@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Icon does not exist and cannot be removed. Icon Identifier: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addIconWithIdentifier:(uint64_t)a3 toCacheAtPath:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Failed to generate icon with identifier %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createCacheDirectoryIfNeeded
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Error trying to create notifications icon cache directory: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
