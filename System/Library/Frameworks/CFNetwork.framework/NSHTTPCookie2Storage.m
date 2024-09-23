@implementation NSHTTPCookie2Storage

- (NSHTTPCookie2Storage)init
{
  NSHTTPCookie2Storage *v2;
  NSPersistentHTTPCookie2Storage *v3;
  NSPersistentHTTPCookie2Storage *persistentStore;
  NSMemoryHTTPCookie2Storage *v5;
  NSMemoryHTTPCookie2Storage *memoryStore;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  id defaultNotificationHandler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSHTTPCookie2Storage;
  v2 = -[NSHTTPCookie2Storage init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NSPersistentHTTPCookie2Storage);
    persistentStore = v2->persistentStore;
    v2->persistentStore = v3;

    v5 = objc_alloc_init(NSMemoryHTTPCookie2Storage);
    memoryStore = v2->memoryStore;
    v2->memoryStore = v5;

    v7 = dispatch_queue_create("com.apple.cfnetwork.cookiestorage", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v7;

    defaultNotificationHandler = v2->_defaultNotificationHandler;
    v2->_defaultNotificationHandler = 0;

  }
  return v2;
}

- (NSHTTPCookie2Storage)initWithPath:(id)a3
{
  id v4;
  NSHTTPCookie2Storage *v5;
  NSPersistentHTTPCookie2Storage *v6;
  NSPersistentHTTPCookie2Storage *persistentStore;
  NSMemoryHTTPCookie2Storage *v8;
  NSMemoryHTTPCookie2Storage *memoryStore;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSHTTPCookie2Storage;
  v5 = -[NSHTTPCookie2Storage init](&v13, sel_init);
  if (v5)
  {
    if (v4)
      v6 = -[NSPersistentHTTPCookie2Storage initWithPath:]([NSPersistentHTTPCookie2Storage alloc], "initWithPath:", v4);
    else
      v6 = objc_alloc_init(NSPersistentHTTPCookie2Storage);
    persistentStore = v5->persistentStore;
    v5->persistentStore = v6;

    v8 = objc_alloc_init(NSMemoryHTTPCookie2Storage);
    memoryStore = v5->memoryStore;
    v5->memoryStore = v8;

    v10 = dispatch_queue_create("com.apple.cfnetwork.cookiestorage", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (id)initInNSMemoryHTTPCookie2Storage
{
  NSHTTPCookie2Storage *v2;
  NSHTTPCookie2Storage *v3;
  NSPersistentHTTPCookie2Storage *persistentStore;
  NSMemoryHTTPCookie2Storage *v5;
  NSMemoryHTTPCookie2Storage *memoryStore;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSHTTPCookie2Storage;
  v2 = -[NSHTTPCookie2Storage init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    persistentStore = v2->persistentStore;
    v2->persistentStore = 0;

    v5 = objc_alloc_init(NSMemoryHTTPCookie2Storage);
    memoryStore = v3->memoryStore;
    v3->memoryStore = v5;

    v7 = dispatch_queue_create("com.apple.cfnetwork.cookiestorage", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

  }
  return v3;
}

- (void)setCookie:(id)a3 withFilter:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__NSHTTPCookie2Storage_setCookie_withFilter_completionHandler___block_invoke;
  v15[3] = &unk_1E14FCA28;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

- (void)setCookies:(id)a3 withFilter:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__NSHTTPCookie2Storage_setCookies_withFilter_completionHandler___block_invoke;
  v15[3] = &unk_1E14FCA28;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

- (void)getCookiesWithFilter:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NSHTTPCookie2Storage *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NSHTTPCookie2Storage_getCookiesWithFilter_completionHandler___block_invoke;
  block[3] = &unk_1E14FE070;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)getAllCookiesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__NSHTTPCookie2Storage_getAllCookiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E14FDF00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)deleteCookie:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSHTTPCookie2LookupFilter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  objc_msgSend(v12, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setDomain:](v7, "setDomain:", v8);

  objc_msgSend(v12, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setName:](v7, "setName:", v9);

  objc_msgSend(v12, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPath:](v7, "setPath:", v10);

  objc_msgSend(v12, "partition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2LookupFilter setPartition:](v7, "setPartition:", v11);

  -[NSHTTPCookie2LookupFilter setSecure:](v7, "setSecure:", 1);
  if (objc_msgSend(v12, "httpOnly"))
    -[NSHTTPCookie2LookupFilter setIgnoreHTTPOnlyCookie:](v7, "setIgnoreHTTPOnlyCookie:", 1);
  else
    -[NSHTTPCookie2LookupFilter setHttpOnly:](v7, "setHttpOnly:", 0);
  -[NSHTTPCookie2Storage deleteCookiesWithFilter:completionHandler:](self, "deleteCookiesWithFilter:completionHandler:", v7, v6);

}

- (void)deleteAllCookiesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__NSHTTPCookie2Storage_deleteAllCookiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E14FDF00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)deleteCookiesWithFilter:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NSHTTPCookie2Storage_deleteCookiesWithFilter_completionHandler___block_invoke;
  block[3] = &unk_1E14FE070;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (id)identifyingData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NSPersistentHTTPCookie2Storage path](self->persistentStore, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("URL"));

    v5 = objc_retainAutorelease(v2);
    objc_msgSend(v5, "fileSystemRepresentation");
    v6 = (const char *)sandbox_extension_issue_file();
    objc_msgSend(v5, "URLByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("sqlite-shm"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "fileSystemRepresentation");
    v9 = (const char *)sandbox_extension_issue_file();

    objc_msgSend(v5, "URLByDeletingPathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("sqlite-wal"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "fileSystemRepresentation");
    v12 = (const char *)sandbox_extension_issue_file();

    if (v6 && v9 && v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v6, strlen(v6) + 1, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("sandboxExt"));

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, strlen(v9) + 1, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("sandboxExtShm"));

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, strlen(v12) + 1, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("sandboxExtWal"));

    }
    else
    {
      getCookieLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136315650;
        v20 = v6;
        v21 = 2080;
        v22 = v9;
        v23 = 2080;
        v24 = v12;
        _os_log_impl(&dword_183ECA000, v16, OS_LOG_TYPE_DEFAULT, "*** Sandbox extension failed %s %s %s", (uint8_t *)&v19, 0x20u);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSHTTPCookie2Storage)initWithIdentifyingData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSHTTPCookie2Storage *v12;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sandboxExt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sandboxExtShm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sandboxExtWal"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 && v7 && v8)
    {
      objc_msgSend(objc_retainAutorelease(v6), "bytes");
      sandbox_extension_consume();
      objc_msgSend(objc_retainAutorelease(v7), "bytes");
      sandbox_extension_consume();
      objc_msgSend(objc_retainAutorelease(v9), "bytes");
      sandbox_extension_consume();
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSHTTPCookie2Storage initWithPath:](self, "initWithPath:", v11);

  }
  else
  {
    v12 = -[NSHTTPCookie2Storage initWithPath:](self, "initWithPath:", 0);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultNotificationHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->memoryStore, 0);
  objc_storeStrong((id *)&self->persistentStore, 0);
}

uint64_t __66__NSHTTPCookie2Storage_deleteCookiesWithFilter_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1[4] + 8), "beginTransaction");
  objc_msgSend(*(id *)(a1[4] + 8), "deleteCookiesWithFilter:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 8), "commitTransaction");
  objc_msgSend(*(id *)(a1[4] + 16), "deleteCookiesWithFilter:", a1[5]);
  result = (*(uint64_t (**)(void))(a1[6] + 16))();
  v3 = a1[4];
  if (v3)
  {
    result = *(_QWORD *)(v3 + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__NSHTTPCookie2Storage_deleteAllCookiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "beginTransaction");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteAllCookies");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "commitTransaction");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteAllCookies");
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    result = *(_QWORD *)(v3 + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __59__NSHTTPCookie2Storage_getAllCookiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getAllCookies");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getAllCookies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  -[NSHTTPCookie2Storage _onqueue_mungeCookies:withCookies:](*(_QWORD *)(a1 + 32), v5, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (id)_onqueue_mungeCookies:(void *)a3 withCookies:
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  _QWORD *v23;
  void *v24;
  BOOL v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  id *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  id v45;
  id v46;
  id obj;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;
  _QWORD block[5];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v43 = v5;
  v44 = a3;
  v48 = a1;
  if (a1)
  {
    v6 = objc_msgSend(v5, "count");
    v7 = v44;
    if (v6 && (v8 = objc_msgSend(v44, "count"), v7 = v5, v8))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = objc_msgSend(v5, "count");
      v11 = objc_msgSend(v44, "count");
      if (v10 >= v11)
        v12 = v5;
      else
        v12 = v44;
      if (v10 >= v11)
        v5 = v44;
      v13 = v12;
      v45 = v5;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v62 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            v18 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v17);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        }
        while (v14);
      }

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v46 = v45;
      v19 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v58 != v20)
              objc_enumerationMutation(v46);
            v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
            v23 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v22);
            objc_msgSend(v9, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24 == 0;

            if (v25)
            {
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v23);
            }
            else
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v22;
              objc_msgSend(v26, "creationDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "creationDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v28 < v29;

              if (v30)
                v31 = v27;
              else
                v31 = v26;
              if (v30)
                v32 = v26;
              else
                v32 = v27;
              v33 = v31;
              v34 = v32;
              if (objc_msgSend(v33, "secure"))
              {
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, v23);
                v35 = *(NSObject **)(v48 + 24);
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke;
                block[3] = &unk_1E14FDE88;
                block[4] = v48;
                v56 = v34;
                dispatch_async(v35, block);
                v36 = &v56;
              }
              else if ((objc_msgSend(v34, "secure") & 1) != 0)
              {
                if (objc_msgSend(v33, "source") == 2)
                {
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, v23);
                  v37 = *(NSObject **)(v48 + 24);
                  v51[0] = MEMORY[0x1E0C809B0];
                  v51[1] = 3221225472;
                  v51[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_25;
                  v51[3] = &unk_1E14FDE88;
                  v51[4] = v48;
                  v52 = v34;
                  dispatch_async(v37, v51);
                  v36 = &v52;
                }
                else
                {
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, v23);
                  v39 = *(NSObject **)(v48 + 24);
                  v49[0] = MEMORY[0x1E0C809B0];
                  v49[1] = 3221225472;
                  v49[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_28;
                  v49[3] = &unk_1E14FDE88;
                  v49[4] = v48;
                  v50 = v33;
                  dispatch_async(v39, v49);
                  v36 = &v50;
                }
              }
              else
              {
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, v23);
                v38 = *(NSObject **)(v48 + 24);
                v53[0] = MEMORY[0x1E0C809B0];
                v53[1] = 3221225472;
                v53[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_22;
                v53[3] = &unk_1E14FDE88;
                v53[4] = v48;
                v54 = v34;
                dispatch_async(v38, v53);
                v36 = &v54;
              }

            }
          }
          v19 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        }
        while (v19);
      }

      objc_msgSend(v9, "allValues");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHTTPCookie2Storage _onqueue_orderCookies:](v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSHTTPCookie2Storage _onqueue_orderCookies:](v7);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)_onqueue_orderCookies:(void *)a1
{
  id v1;
  void *v2;

  v1 = a1;
  objc_msgSend(v1, "sortedArrayUsingComparator:", &__block_literal_global_19_14670);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteCookie:withCompletionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_21_14668);
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteCookie:withCompletionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_24_14666);
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteCookie:withCompletionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_27_14664);
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteCookie:withCompletionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_30_14662);
}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2_29()
{
  NSObject *v0;
  uint8_t v1[16];

  getCookieLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_183ECA000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }

}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2_26()
{
  NSObject *v0;
  uint8_t v1[16];

  getCookieLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_183ECA000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }

}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2_23()
{
  NSObject *v0;
  uint8_t v1[16];

  getCookieLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_183ECA000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }

}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  getCookieLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_183ECA000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }

}

uint64_t __46__NSHTTPCookie2Storage__onqueue_orderCookies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 > v9)
    goto LABEL_2;
  objc_msgSend(v4, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  objc_msgSend(v5, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v12 < v14)
    goto LABEL_4;
  objc_msgSend(v4, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 < v17)
  {
LABEL_2:
    v10 = -1;
    goto LABEL_5;
  }
  objc_msgSend(v4, "creationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 > v19)
  {
LABEL_4:
    v10 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v4, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "compare:", v21);

  if (v22 == -1)
    v10 = -1;
  else
    v10 = v22 == 1;
LABEL_5:

  return v10;
}

void __63__NSHTTPCookie2Storage_getCookiesWithFilter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFURL *v3;
  const __CFURL *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "acceptPolicy") != 3)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "mainDocumentURL");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_4;
  v10 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "inURL");
  v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mainDocumentURL");
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v5 = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v3, v4, 0);

  if ((v5 & 1) == 0)
  {
    getCookieLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183ECA000, v9, OS_LOG_TYPE_DEFAULT, "Not sending cookie since policy is NSHTTPCookieAcceptPolicyExclusivelyFromMainDocumentDomain and the inURL and mainDocumentURL are in different domains", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "getCookiesWithFilter:", *(_QWORD *)(a1 + 32));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "getCookiesWithFilter:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    -[NSHTTPCookie2Storage _onqueue_mungeCookies:withCookies:](*(_QWORD *)(a1 + 40), v11, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __64__NSHTTPCookie2Storage_setCookies_withFilter_completionHandler___block_invoke(uint64_t a1)
{
  -[NSHTTPCookie2Storage _onqueue_setCookies:withFilter:completionHandler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)_onqueue_setCookies:(void *)a3 withFilter:(void *)a4 completionHandler:
{
  void (**v7)(_QWORD);
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v20 = a3;
  v7 = a4;
  if (a1)
  {
    -[NSHTTPCookie2Storage _onqueue_copyCookiesEligibleToBeSet:withFilter:](a1, v19, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v18;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_msgSend(v14, "expirationDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                v16 = v9;
              else
                v16 = v8;
              objc_msgSend(v16, "addObject:", v14);

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v11);
        }

        objc_msgSend(*(id *)(a1 + 8), "beginTransaction");
        objc_msgSend(*(id *)(a1 + 8), "setCookies:", v9);
        objc_msgSend(*(id *)(a1 + 8), "deleteCookies:", v8);
        objc_msgSend(*(id *)(a1 + 8), "commitTransaction");
        objc_msgSend(*(id *)(a1 + 16), "setCookies:", v8);
        objc_msgSend(*(id *)(a1 + 16), "deleteCookies:", v9);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 16), "setCookies:", v18);
      }
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        (*(void (**)(void))(v17 + 16))();
    }
    v7[2](v7);

  }
}

- (id)_onqueue_copyCookiesEligibleToBeSet:(void *)a3 withFilter:
{
  NSObject *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSHTTPCookie2LookupFilter *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  const __CFURL *v20;
  id v21;
  uint64_t v22;
  const __CFURL *v23;
  void *v24;
  NSHTTPCookie2LookupFilter *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  int v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  id v55;
  int v56;
  char v57;
  NSObject *v58;
  char v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  __CFString *v64;
  void *v65;
  __CFString *v66;
  NSObject *v67;
  NSObject *v68;
  const char *v69;
  uint32_t v70;
  uint32_t v71;
  void *v72;
  char v73;
  NSObject *v74;
  void *v75;
  void *v76;
  __CFString *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  BOOL v88;
  const __CFURL *v89;
  const __CFURL *v90;
  char v91;
  uint64_t v92;
  void *v93;
  __CFString *v94;
  id v95;
  void *v96;
  _BOOL4 v97;
  NSObject *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSHTTPCookie2LookupFilter *v102;
  _BOOL4 v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  __CFString *v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  _QWORD *v114;
  char v115;
  NSObject *v116;
  id v117;
  id v119;
  void *v120;
  id v121;
  id obj;
  id v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  id v129;
  id v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint8_t v136[16];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  char v145;
  _BYTE v146[128];
  uint8_t v147[128];
  uint8_t buf[4];
  uint64_t v149;
  __int16 v150;
  __CFString *v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v119 = a2;
  v129 = a3;
  v121 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  getCookieLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v149 = (uint64_t)v119;
    _os_log_debug_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEBUG, "Checking eligibity of cookies : %@", buf, 0xCu);
  }

  objc_msgSend(v129, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
  {
    v130 = 0;
    v11 = 0;
  }
  else
  {
    v8 = objc_alloc_init(NSHTTPCookie2LookupFilter);
    objc_msgSend(v129, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSHTTPCookie2LookupFilter setDomain:](v8, "setDomain:", v10);

    -[NSHTTPCookie2LookupFilter setIgnoreHostOnlyFlag:](v8, "setIgnoreHostOnlyFlag:", 1);
    -[NSHTTPCookie2LookupFilter setIgnoreHTTPOnlyCookie:](v8, "setIgnoreHTTPOnlyCookie:", 1);
    -[NSHTTPCookie2LookupFilter setIgnoreSecureFlag:](v8, "setIgnoreSecureFlag:", 1);
    objc_msgSend(*(id *)(a1 + 16), "getCookiesWithFilter:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "getCookiesWithFilter:", v8);
    v130 = (id)objc_claimAutoreleasedReturnValue();

  }
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  obj = v119;
  v131 = (id)v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
  if (v12)
  {
    v126 = *(_QWORD *)v133;
    do
    {
      v127 = v12;
      for (i = 0; i != v127; ++i)
      {
        if (*(_QWORD *)v133 != v126)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
        objc_msgSend(v129, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "host");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (v17)
        {
          v25 = objc_alloc_init(NSHTTPCookie2LookupFilter);
          objc_msgSend(v14, "domain");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSHTTPCookie2LookupFilter setDomain:](v25, "setDomain:", v26);

          -[NSHTTPCookie2LookupFilter setIgnoreHostOnlyFlag:](v25, "setIgnoreHostOnlyFlag:", 1);
          -[NSHTTPCookie2LookupFilter setIgnoreHTTPOnlyCookie:](v25, "setIgnoreHTTPOnlyCookie:", 1);
          -[NSHTTPCookie2LookupFilter setIgnoreSecureFlag:](v25, "setIgnoreSecureFlag:", 1);
          objc_msgSend(*(id *)(a1 + 16), "getCookiesWithFilter:", v25);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 8), "getCookiesWithFilter:", v25);
          v27 = objc_claimAutoreleasedReturnValue();

          v130 = (id)v27;
        }
        else
        {
          v18 = v14;
          v19 = v129;
          objc_msgSend(v19, "url");
          v20 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          v21 = objc_alloc_init(MEMORY[0x1E0CB3998]);
          objc_msgSend(v18, "domain");
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setHost:", v22);

          objc_msgSend(v21, "URL");
          v23 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v23, v20, 1);

          if ((v22 & 1) == 0)
          {
            getCookieLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              goto LABEL_130;
            *(_DWORD *)buf = 138412290;
            v149 = (uint64_t)v18;
            v38 = v37;
            v39 = "Ignoring cookie since it's not in the domain of the inURL. Cookie ignored = %@";
            goto LABEL_66;
          }
          v24 = v131;
        }
        v28 = v14;
        v29 = v129;
        objc_msgSend(v28, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "hasPrefix:", CFSTR("__Secure-"));
        if ((v31 & 1) != 0 || (objc_msgSend(v30, "hasPrefix:", CFSTR("__Host-")) & 1) != 0)
        {
          if (!objc_msgSend(v28, "secure"))
            goto LABEL_71;
          objc_msgSend(v29, "url");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32 == 0;

          if (!v33)
          {
            objc_msgSend(v29, "url");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "scheme");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v35, "caseInsensitiveCompare:", 0x1EDD00AE0)
              && objc_msgSend(v35, "caseInsensitiveCompare:", 0x1EDD00BF8)
              || (v31 & 1) == 0
              && (!objc_msgSend(v28, "hostOnly")
               || (objc_msgSend(v28, "path"),
                   v72 = (void *)objc_claimAutoreleasedReturnValue(),
                   v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("/")),
                   v72,
                   (v73 & 1) == 0)))
            {

LABEL_71:
              getCookieLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v149 = (uint64_t)v28;
                _os_log_debug_impl(&dword_183ECA000, v37, OS_LOG_TYPE_DEBUG, "Ignoring cookie based on Prefix rules. Cookie = %@", buf, 0xCu);
              }
              v131 = v24;
              goto LABEL_130;
            }

          }
        }

        v128 = v28;
        v36 = v29;
        v125 = v24;
        v124 = v130;
        if ((objc_msgSend(v36, "isTrusted") & 1) != 0)
        {

        }
        else
        {
          objc_msgSend(v128, "name");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v131 = v125;
          v41 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v142;
            while (2)
            {
              for (j = 0; j != v41; ++j)
              {
                if (*(_QWORD *)v142 != v42)
                  objc_enumerationMutation(v131);
                v44 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * j);
                objc_msgSend(v44, "name");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v45, "isEqualToString:", v40);

                if (v46)
                {
                  v47 = v44;
                  goto LABEL_37;
                }
              }
              v41 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
              if (v41)
                continue;
              break;
            }
          }
          v47 = 0;
LABEL_37:

          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          v130 = v124;
          v48 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
          if (v48)
          {
            v49 = *(_QWORD *)v138;
            while (2)
            {
              for (k = 0; k != v48; ++k)
              {
                if (*(_QWORD *)v138 != v49)
                  objc_enumerationMutation(v130);
                v51 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * k);
                objc_msgSend(v51, "name");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "isEqualToString:", v40);

                if (v53)
                {
                  if (v47)
                  {
                    getCookieLogHandle();
                    v54 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)v136 = 0;
                      _os_log_fault_impl(&dword_183ECA000, v54, OS_LOG_TYPE_FAULT, "cookie with the same name should not be present for the same eld+1.", v136, 2u);
                    }

                  }
                  v55 = v51;

                  v47 = v55;
                  goto LABEL_51;
                }
              }
              v48 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
              if (v48)
                continue;
              break;
            }
          }
LABEL_51:

          v56 = objc_msgSend(v47, "secure");
          v57 = v56;
          if (v56)
          {
            getCookieLogHandle();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v136 = 0;
              _os_log_debug_impl(&dword_183ECA000, v58, OS_LOG_TYPE_DEBUG, "Cannot overwrite a cookie with the same name from an untrusted endpoint", v136, 2u);
            }

          }
          v145 = v57 ^ 1;

          v59 = v145;
          if ((v59 & 1) == 0)
          {
            getCookieLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              goto LABEL_130;
            *(_DWORD *)buf = 138412290;
            v149 = (uint64_t)v128;
            v38 = v37;
            v39 = "Ignoring cookie based on Secure Attribute. Cookie= %@";
LABEL_66:
            v71 = 12;
LABEL_67:
            _os_log_debug_impl(&dword_183ECA000, v38, OS_LOG_TYPE_DEBUG, v39, buf, v71);
            goto LABEL_130;
          }
        }
        v60 = v128;
        v61 = v36;
        objc_msgSend(v60, "domain");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "hasPrefix:", CFSTR(".")))
        {
          objc_msgSend(v60, "domain");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "substringFromIndex:", 1);
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v60, "domain");
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        if (isTopLevelDomain(v64, 1))
        {
          objc_msgSend(v61, "url");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "host");
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!v66 || -[__CFString caseInsensitiveCompare:](v66, "caseInsensitiveCompare:", v64))
          {
            getCookieLogHandle();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v149 = (uint64_t)v60;
              v150 = 2112;
              v151 = v64;
              v68 = v67;
              v69 = "Cookie %@ is trying to be set on TLD %@ domain";
              v70 = 22;
              goto LABEL_85;
            }
            goto LABEL_86;
          }
          getCookieLogHandle();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v149 = (uint64_t)v60;
            v150 = 2112;
            v151 = v66;
            _os_log_debug_impl(&dword_183ECA000, v74, OS_LOG_TYPE_DEBUG, "Allowing cookie to be set on TLD since it's an exact host match. Cookie = %@, TLD = %@", buf, 0x16u);
          }

        }
        objc_msgSend(v61, "url");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (v75)
        {
          objc_msgSend(v61, "url");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "host");
          v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v78 = +[NSHTTPCookieStorageUtils looksLikeIPAddress:]((uint64_t)NSHTTPCookieStorageUtils, v77);

          if (v78)
          {
            objc_msgSend(v61, "url");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "host");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v80, "hasPrefix:", CFSTR(".")))
            {
              objc_msgSend(v61, "url");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "host");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "substringFromIndex:", 1);
              v66 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v61, "url");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "host");
              v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

            if (-[__CFString caseInsensitiveCompare:](v66, "caseInsensitiveCompare:", v64))
            {
              getCookieLogHandle();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v149 = (uint64_t)v60;
                v68 = v67;
                v69 = "Cookie is being set with a partial IP address. cookie = %@";
                v70 = 12;
LABEL_85:
                _os_log_debug_impl(&dword_183ECA000, v68, OS_LOG_TYPE_DEBUG, v69, buf, v70);
              }
LABEL_86:

              getCookieLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v149 = (uint64_t)v60;
                _os_log_fault_impl(&dword_183ECA000, v37, OS_LOG_TYPE_FAULT, "Ignoring cookie  based on IP or TLD rule %@", buf, 0xCu);
              }
              v130 = v124;
              v131 = v125;
              goto LABEL_130;
            }

          }
        }

        v83 = (__CFString *)v60;
        v84 = v61;
        v85 = v125;
        v130 = v124;
        v131 = v85;
        v86 = objc_msgSend(v84, "acceptPolicy");
        switch(v86)
        {
          case 1:

LABEL_97:
            getCookieLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              v92 = objc_msgSend(v84, "acceptPolicy");
              *(_DWORD *)buf = 134218242;
              v149 = v92;
              v150 = 2112;
              v151 = v83;
              v38 = v37;
              v39 = "Ignoring cookie since accept policy doesn't allow the cookie to be set. AcceptPolicy = %lu. Cookie = %@";
              v71 = 22;
              goto LABEL_67;
            }
            goto LABEL_130;
          case 2:
            objc_msgSend(v84, "partition");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            if (v93 || objc_msgSend(v131, "count"))
            {

LABEL_102:
              goto LABEL_103;
            }
            if (objc_msgSend(v130, "count"))
              goto LABEL_102;
            break;
          case 3:
            break;
          default:
            goto LABEL_102;
        }
        objc_msgSend(v84, "mainDocumentURL");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v87 == 0;

        if (v88)
          goto LABEL_102;
        objc_msgSend(v84, "url");
        v89 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "mainDocumentURL");
        v90 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        v91 = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v89, v90, 0);

        if ((v91 & 1) == 0)
          goto LABEL_97;
LABEL_103:
        v94 = v83;
        v95 = v84;
        -[__CFString expirationDate](v94, "expirationDate");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v96 == 0;

        if (v97)
        {

        }
        else
        {
          getCookieLogHandle();
          v98 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v149 = (uint64_t)v94;
            _os_log_debug_impl(&dword_183ECA000, v98, OS_LOG_TYPE_DEBUG, "Checking expiry of cookie %@", buf, 0xCu);
          }

          -[__CFString expirationDate](v94, "expirationDate");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v99, "compare:", v100);

          getCookieLogHandle();
          v102 = (NSHTTPCookie2LookupFilter *)objc_claimAutoreleasedReturnValue();
          v103 = os_log_type_enabled(&v102->super, OS_LOG_TYPE_DEBUG);
          if (v101 == -1)
          {
            if (v103)
            {
              *(_DWORD *)buf = 138412290;
              v149 = (uint64_t)v94;
              _os_log_debug_impl(&dword_183ECA000, &v102->super, OS_LOG_TYPE_DEBUG, "Cookie is expired %@", buf, 0xCu);
            }

            v102 = objc_alloc_init(NSHTTPCookie2LookupFilter);
            -[__CFString domain](v94, "domain");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSHTTPCookie2LookupFilter setDomain:](v102, "setDomain:", v104);

            -[__CFString name](v94, "name");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSHTTPCookie2LookupFilter setName:](v102, "setName:", v105);

            -[__CFString path](v94, "path");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSHTTPCookie2LookupFilter setPath:](v102, "setPath:", v106);

            -[__CFString partition](v94, "partition");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSHTTPCookie2LookupFilter setPartition:](v102, "setPartition:", v107);

            -[NSHTTPCookie2LookupFilter setIgnoreHTTPOnlyCookie:](v102, "setIgnoreHTTPOnlyCookie:", objc_msgSend(v95, "overwriteHTTPOnlyCookies"));
            v108 = *(void **)(a1 + 8);
            if (v108)
            {
              objc_msgSend(v108, "beginTransaction");
              objc_msgSend(*(id *)(a1 + 8), "deleteCookiesWithFilter:", v102);
              objc_msgSend(*(id *)(a1 + 8), "commitTransaction");
            }
            objc_msgSend(*(id *)(a1 + 16), "deleteCookiesWithFilter:", v102);
          }
          else if (v103)
          {
            *(_DWORD *)buf = 138412290;
            v149 = (uint64_t)v94;
            _os_log_debug_impl(&dword_183ECA000, &v102->super, OS_LOG_TYPE_DEBUG, "Cookie is not expired %@", buf, 0xCu);
          }

          if (v101 == -1)
          {
            getCookieLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v149 = (uint64_t)v94;
              v38 = v37;
              v39 = "Ignoring cookie since it's expired. Ignoring cookie and deleting from store if exists. Cookie = %@";
              goto LABEL_66;
            }
            goto LABEL_130;
          }
        }
        v109 = v94;
        v110 = v95;
        v111 = v131;
        v130 = v130;
        v131 = v111;
        if ((objc_msgSend(v110, "overwriteHTTPOnlyCookies") & 1) != 0
          || (-[__CFString httpOnly](v109, "httpOnly") & 1) != 0)
        {

LABEL_119:
          v37 = -[__CFString mutableCopy](v109, "mutableCopy");
          -[__CFString partition](v109, "partition");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = v112;
          if (!v112)
          {
            objc_msgSend(v110, "partition");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = v120;
          }
          -[NSObject setPartition:](v37, "setPartition:", v113);
          if (!v112)

          objc_msgSend(v121, "addObject:", v37);
          goto LABEL_130;
        }
        v114 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v109);
        if ((-[NSHTTPCookie2Storage _onqueue_findHTTPCookieFromArray:matchingKey:](v111, v114) & 1) != 0)
        {

        }
        else
        {
          v115 = -[NSHTTPCookie2Storage _onqueue_findHTTPCookieFromArray:matchingKey:](v130, v114);

          if ((v115 & 1) == 0)
            goto LABEL_119;
        }
        getCookieLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v149 = (uint64_t)v109;
          v38 = v37;
          v39 = "Ignoring cookie since it's trying to overwrite a httpony cookie with a non-httponly cookie. Cookie = %@";
          goto LABEL_66;
        }
LABEL_130:

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
    }
    while (v12);
  }

  getCookieLogHandle();
  v116 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v149 = (uint64_t)v121;
    _os_log_debug_impl(&dword_183ECA000, v116, OS_LOG_TYPE_DEBUG, "Cookies eligible to be set = %@", buf, 0xCu);
  }

  v117 = v121;
  return v117;
}

- (uint64_t)_onqueue_findHTTPCookieFromArray:(void *)a1 matchingKey:(void *)a2
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v9);
        if (objc_msgSend(v10, "isEqual:", v4, (_QWORD)v12) && objc_msgSend(v9, "httpOnly"))
        {

          v6 = 1;
          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

void __63__NSHTTPCookie2Storage_setCookie_withFilter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2Storage _onqueue_setCookies:withFilter:completionHandler:](v2, v3, *(void **)(a1 + 48), *(void **)(a1 + 56));

}

+ (id)sharedNSHTTPCookie2Storage
{
  if (+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::onceToken != -1)
    dispatch_once(&+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::onceToken, &__block_literal_global_14710);
  return (id)+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::sharedCookieStorage;
}

void __50__NSHTTPCookie2Storage_sharedNSHTTPCookie2Storage__block_invoke()
{
  NSHTTPCookie2Storage *v0;
  void *v1;

  v0 = objc_alloc_init(NSHTTPCookie2Storage);
  v1 = (void *)+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::sharedCookieStorage;
  +[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::sharedCookieStorage = (uint64_t)v0;

}

void __68__NSHTTPCookie2Storage__setDefaultCookieChangedNotificationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

@end
